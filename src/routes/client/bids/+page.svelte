<script>
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';
  import { onMount } from 'svelte';
  import { page } from '$app/stores';
  import { walletBalance } from '$lib/stores/wallet';

  let bids = $state([
    { id: 'B-101', loadId: 'L-8942', amount: '$450', driver: 'John Doe', driverId: 'DRV-8821', vehiclePlate: 'KA-05-MJ-8821', phone: '+1 (555) 0012', status: 'Accepted', date: 'Oct 24, 2026', verified: true, otp: '8521' },
    { id: 'B-102', loadId: 'L-8942', amount: '$420', driver: 'Jane Smith', driverId: 'DRV-9932', vehiclePlate: 'MH-02-DN-9932', phone: '+1 (555) 0013', status: 'Pending', date: 'Oct 24, 2026', verified: false, otp: null },
    { id: 'B-103', loadId: 'L-8940', amount: '$580', driver: 'Mike Ross', driverId: 'DRV-1120', vehiclePlate: 'TN-09-AL-1120', phone: '+1 (555) 0014', status: 'Outbid', date: 'Oct 23, 2026', verified: false, otp: null },
    { id: '442', loadId: 'L-CHI-DET', amount: '$800', driver: 'FastTrack', driverId: 'FT-9921', vehiclePlate: 'IL-55-XY-3321', phone: '+1 (555) 8821', status: 'Pending', date: 'Today', verified: false, otp: null }
  ]);

  let selectedBid = $state(null);
  let showVerification = $state(false);
  let showPayment = $state(false);
  let showOtpModal = $state(false);
  let activeMenuId = $state(null); // Track which row's menu is open
  let paymentStep = $state('review'); // review, processing, success
  let generatedOtp = $state('');
  let currentOtp = $state('');

  onMount(() => {
      const verifyId = $page.url.searchParams.get('verify');
      if (verifyId) {
          const bid = bids.find(b => b.id === verifyId);
          if (bid) handleVerify(bid);
      }
  });

  function handleVerify(bid) {
      selectedBid = bid;
      showVerification = true;
      activeMenuId = null;
  }

  function handleReject(bid) {
      bids = bids.map(b => b.id === bid.id ? {...b, status: 'Rejected'} : b);
      activeMenuId = null;
  }

  function handleViewOtp(bid) {
      currentOtp = bid.otp;
      showOtpModal = true;
      activeMenuId = null;
  }

  function toggleMenu(id) {
      if (activeMenuId === id) {
          activeMenuId = null;
      } else {
          activeMenuId = id;
      }
  }

  function handleMenuAction(action, bid) {
      console.log(`Action ${action} on bid ${bid.id}`);
      activeMenuId = null;
      // Implement specific action logic here
      if (action === 'call') alert(`Calling ${bid.driver} at ${bid.phone}...`);
  }

  // Click outside to close menu - simplistic approach
  function handleBackdropClick() {
      if (activeMenuId) activeMenuId = null;
  }

  function confirmVerification() {
      // Mark as verified but not yet accepted
      // In a real app, this might just update the UI state to allow acceptance
      showVerification = false;
      showPayment = true; // Proceed directly to payment/acceptance flow
  }

  function handlePayment() {
      const amount = Number(selectedBid.amount.replace(/[^0-9.-]+/g,""));
      
      if ($walletBalance < amount) {
          alert(`Insufficient balance ($${$walletBalance}). Please add funds to your wallet.`);
          return;
      }

      paymentStep = 'processing';
      setTimeout(() => {
          $walletBalance -= amount;
          paymentStep = 'success';
          const newOtp = Math.floor(1000 + Math.random() * 9000).toString();
          generatedOtp = newOtp;
          // Update bid status
          bids = bids.map(b => b.id === selectedBid.id ? {...b, status: 'Accepted', verified: true, otp: newOtp} : b);
      }, 2000);
  }

  function closeAll() {
      selectedBid = null;
      showVerification = false;
      showPayment = false;
      showOtpModal = false;
      activeMenuId = null;
      paymentStep = 'review';
      generatedOtp = '';
      currentOtp = '';
  }
</script>

<!-- Backdrop for closing menus -->
{#if activeMenuId}
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <div class="fixed inset-0 z-30 cursor-default" onclick={handleBackdropClick}></div>
{/if}

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="bids" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Market Proposals</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Live competitive matrix</p>
            </div>
            <div class="flex items-center gap-3">
                <span class="bg-emerald-50 text-emerald-600 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider border border-emerald-100 italic">Market Active</span>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="premium-card overflow-visible">
                <table class="w-full text-left border-collapse">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Bid Node</th>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Target Shipment</th>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Driver Details</th>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Financial Stake</th>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Status</th>
                            <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400 text-right">Manage</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each bids as bid}
                            <tr class="hover:bg-slate-50/50 transition-all group relative {activeMenuId === bid.id ? 'z-50' : 'z-0'}">
                                <td class="px-6 py-6 font-black text-primary tracking-tighter">{bid.id}</td>
                                <td class="px-6 py-6">
                                    <div class="flex flex-col">
                                        <span class="text-xs font-black text-slate-900">{bid.loadId}</span>
                                        <span class="text-[9px] font-bold text-slate-400 uppercase">Archive Node</span>
                                    </div>
                                </td>
                                <td class="px-6 py-6">
                                    <div class="flex items-center gap-3">
                                        <div class="size-9 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-colors shrink-0">
                                            <span class="material-symbols-outlined text-[20px]">badge</span>
                                        </div>
                                        <div>
                                            <p class="text-xs font-black text-slate-900">{bid.driver}</p>
                                            <div class="flex items-center gap-1.5 mt-0.5">
                                                <p class="text-[9px] font-bold text-slate-400 uppercase tracking-widest">{bid.driverId}</p>
                                                <span class="size-1 rounded-full bg-slate-200"></span>
                                                <p class="text-[9px] font-bold text-slate-500 font-mono tracking-tight bg-slate-100 px-1 rounded">{bid.vehiclePlate}</p>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-6">
                                    <span class="text-sm font-black text-slate-900 group-hover:text-primary transition-colors">{bid.amount}</span>
                                </td>
                                <td class="px-6 py-6">
                                    <span class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider 
                                        {bid.status === 'Accepted' ? 'bg-emerald-50 text-emerald-600 border border-emerald-100' : 
                                         bid.status === 'Pending' ? 'bg-blue-50 text-blue-600 border border-blue-100' : 'bg-red-50 text-red-600 border border-red-100'}">
                                        {bid.status}
                                    </span>
                                </td>
                                <td class="px-6 py-6 text-right">
                                    <div class="flex items-center justify-end gap-2 relative">
                                        {#if bid.status === 'Pending'}
                                            <button onclick={() => handleVerify(bid)} class="px-4 py-2 bg-slate-900 text-white rounded-lg text-[10px] font-black uppercase tracking-widest hover:bg-primary transition-colors shadow-lg shadow-slate-200 relative z-0">
                                                Verify
                                            </button>
                                        {:else if bid.status === 'Accepted'}
                                             <button onclick={() => handleViewOtp(bid)} class="px-3 py-2 bg-emerald-50 text-emerald-600 border border-emerald-200 rounded-lg text-[10px] font-black uppercase tracking-widest hover:bg-emerald-100 transition-colors flex items-center gap-1 relative z-0">
                                               <span class="material-symbols-outlined text-sm">lock</span>
                                               OTP
                                           </button>
                                        {/if}

                                        <!-- Manage Button & Dropdown -->
                                        <div class="relative z-50">
                                            <button 
                                                onclick={() => toggleMenu(bid.id)}
                                                class="size-8 rounded-lg border border-slate-200 text-slate-400 hover:text-primary hover:bg-slate-50 hover:border-slate-300 flex items-center justify-center transition-all {activeMenuId === bid.id ? 'bg-slate-50 text-primary border-slate-300' : ''}"
                                            >
                                                <span class="material-symbols-outlined text-lg">more_horiz</span>
                                            </button>

                                            {#if activeMenuId === bid.id}
                                                <div class="absolute right-0 top-full mt-2 w-48 bg-white rounded-xl shadow-xl border border-slate-100 overflow-hidden z-40 animate-scale-up origin-top-right">
                                                    <div class="p-1">
                                                        <button onclick={() => handleMenuAction('call', bid)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                            <span class="material-symbols-outlined text-sm">call</span>
                                                            Call Driver
                                                        </button>
                                                        <button onclick={() => handleMenuAction('msg', bid)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                            <span class="material-symbols-outlined text-sm">message</span>
                                                            Message
                                                        </button>
                                                        <button onclick={() => handleMenuAction('profile', bid)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                            <span class="material-symbols-outlined text-sm">person</span>
                                                            View Profile
                                                        </button>
                                                        <div class="h-px bg-slate-100 my-1"></div>
                                                        <button onclick={() => handleReject(bid)} class="w-full text-left px-3 py-2 text-xs font-bold text-red-500 hover:bg-red-50 rounded-lg flex items-center gap-2 transition-colors">
                                                            <span class="material-symbols-outlined text-sm">block</span>
                                                            Reject Bid
                                                        </button>
                                                    </div>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Verification Modal -->
    {#if showVerification && selectedBid}
    <div class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/60 backdrop-blur-md animate-fade-in p-6">
        <div class="bg-white rounded-3xl overflow-hidden max-w-4xl w-full shadow-2xl scale-100 animate-scale-up flex flex-col md:flex-row h-[600px]">
            <!-- Left: Driver Details -->
            <div class="w-full md:w-1/3 bg-slate-50 border-r border-slate-100 p-8 overflow-y-auto">
                <div class="flex items-center gap-4 mb-8">
                    <div class="size-16 rounded-2xl bg-slate-200 overflow-hidden">
                         <img src={`https://ui-avatars.com/api/?name=${selectedBid.driver}&background=random`} alt="Driver" class="w-full h-full object-cover" />
                    </div>
                    <div>
                        <h3 class="text-xl font-black text-slate-900 leading-none">{selectedBid.driver}</h3>
                        <p class="text-xs font-bold text-slate-400 mt-1 uppercase tracking-widest">{selectedBid.driverId}</p>
                    </div>
                </div>

                <div class="space-y-6">
                    <div>
                        <h4 class="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-3">Verified Credentials</h4>
                        <div class="space-y-2">
                            <div class="flex items-center gap-3 p-3 bg-white rounded-xl border border-slate-100">
                                <span class="material-symbols-outlined text-emerald-500 text-lg">check_circle</span>
                                <span class="text-xs font-bold text-slate-700">Commercial License</span>
                            </div>
                            <div class="flex items-center gap-3 p-3 bg-white rounded-xl border border-slate-100">
                                <span class="material-symbols-outlined text-emerald-500 text-lg">check_circle</span>
                                <span class="text-xs font-bold text-slate-700">Aadhar Verification</span>
                            </div>
                             <div class="flex items-center gap-3 p-3 bg-white rounded-xl border border-slate-100">
                                <span class="material-symbols-outlined text-emerald-500 text-lg">check_circle</span>
                                <span class="text-xs font-bold text-slate-700">Clean Background Check</span>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h4 class="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-3">Vehicle Details</h4>
                        <div class="p-4 bg-white rounded-xl border border-slate-100 text-xs text-slate-600 space-y-2">
                            <div class="flex justify-between">
                                <span class="font-bold">Truck Model</span>
                                <span>Volvo FH16</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="font-bold">Plate No</span>
                                <span class="uppercase font-mono">KA-01-HH-1234</span>
                            </div>
                            <div class="flex justify-between text-emerald-600">
                                <span class="font-bold">Insurance</span>
                                <span>Valid until 2028</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Real-time Map & Actions -->
            <div class="flex-1 flex flex-col">
                <div class="flex-1 bg-slate-200 relative">
                     <iframe 
                        width="100%" 
                        height="100%" 
                        frameborder="0" 
                        style="border:0; filter: grayscale(100%) contrast(1.2);"
                        title="Driver Location"
                        src="https://maps.google.com/maps?q=12.9716,77.5946&z=14&output=embed"
                        class="opacity-80 mix-blend-multiply">
                    </iframe>
                    <div class="absolute inset-0 bg-primary/5 pointer-events-none"></div>
                    <div class="absolute top-4 left-4 glass px-4 py-2 rounded-xl flex items-center gap-3">
                        <span class="relative flex h-3 w-3">
                          <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                          <span class="relative inline-flex rounded-full h-3 w-3 bg-emerald-500"></span>
                        </span>
                        <div>
                            <p class="text-[9px] font-black uppercase tracking-widest text-slate-900">Live Satellite Feed</p>
                            <p class="text-[9px] font-bold text-slate-500">Updating 1s ago</p>
                        </div>
                    </div>
                </div>

                <div class="p-8 border-t border-slate-100 bg-white flex items-center justify-between gap-6">
                    <button class="flex items-center gap-4 text-slate-500 cursor-pointer hover:text-primary transition-colors bg-transparent border-none" onclick={() => showVerification = false}>
                        <span class="material-symbols-outlined">arrow_back</span>
                        <span class="text-xs font-black uppercase tracking-widest">Back</span>
                    </button>
                    <button onclick={confirmVerification} class="px-8 py-3 bg-slate-900 text-white rounded-xl font-black text-xs uppercase tracking-widest shadow-xl hover:bg-primary transition-colors flex items-center gap-2">
                        <span class="material-symbols-outlined text-lg">verified_user</span>
                        Verify & Accept Bid
                    </button>
                </div>
            </div>
        </div>
    </div>
    {/if}

    <!-- Payment Modal -->
    {#if showPayment}
    <div class="fixed inset-0 z-[60] flex items-center justify-center bg-slate-900/80 backdrop-blur-md animate-fade-in p-6">
        <div class="bg-white rounded-3xl overflow-hidden max-w-sm w-full shadow-2xl scale-100 animate-scale-up border-[3px] border-slate-100 text-center p-8">
            {#if paymentStep === 'review'}
                <div class="size-16 rounded-full bg-blue-50 text-primary flex items-center justify-center mx-auto mb-6">
                    <span class="material-symbols-outlined text-3xl">account_balance_wallet</span>
                </div>
                <h3 class="text-2xl font-black text-slate-900 mb-2">Escrow Payment</h3>
                <p class="text-slate-500 text-sm font-medium mb-8 leading-relaxed">
                    Transfer <span class="text-slate-900 font-bold">{selectedBid.amount}</span> to the secure platform vault. Only released upon successful OTP verification.
                </p>
                <div class="bg-slate-50 rounded-xl p-4 mb-8 text-left border border-slate-100">
                    <div class="flex justify-between mb-2">
                        <span class="text-xs font-bold text-slate-400">Bid Amount</span>
                        <span class="text-xs font-bold text-slate-900">{selectedBid.amount}</span>
                    </div>
                    <div class="flex justify-between mb-2">
                        <span class="text-xs font-bold text-slate-400">Platform Fee</span>
                        <span class="text-xs font-bold text-slate-900">$15.00</span>
                    </div>
                    <div class="h-px bg-slate-200 my-2"></div>
                    <div class="flex justify-between">
                        <span class="text-sm font-black text-slate-900">Total</span>
                        <span class="text-sm font-black text-slate-900">$465.00</span>
                    </div>
                </div>
                <button onclick={handlePayment} class="w-full py-4 bg-emerald-500 text-white rounded-xl font-black text-sm uppercase tracking-widest shadow-lg shadow-emerald-500/30 hover:scale-105 transition-transform flex items-center justify-center gap-2">
                    <span class="material-symbols-outlined">lock</span>
                    Pay Securely
                </button>
            
            {:else if paymentStep === 'processing'}
                 <div class="py-12 flex flex-col items-center">
                    <div class="size-16 border-4 border-slate-100 border-t-primary rounded-full animate-spin mb-6"></div>
                    <h3 class="text-lg font-black text-slate-900 uppercase tracking-widest">Processing...</h3>
                    <p class="text-xs font-bold text-slate-400 mt-2">Securing funds in vault</p>
                 </div>

            {:else if paymentStep === 'success'}
                <div class="size-20 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-6 animate-bounce">
                    <span class="material-symbols-outlined text-4xl">check_circle</span>
                </div>
                <h3 class="text-2xl font-black text-slate-900 mb-2">Payment Secured</h3>
                <p class="text-slate-500 text-sm font-medium mb-6">
                    The driver can now start the job. Share this OTP when they arrive to release funds.
                </p>
                
                <div class="bg-slate-900 text-white p-6 rounded-2xl mb-8 relative overflow-hidden group">
                    <div class="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20"></div>
                    <p class="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Delivery Release OTP</p>
                    <div class="text-4xl font-black tracking-[0.2em] font-mono">{generatedOtp}</div>
                </div>

                <button onclick={closeAll} class="w-full py-4 bg-slate-100 text-slate-900 rounded-xl font-black text-xs uppercase tracking-widest hover:bg-slate-200 transition-colors">
                    Close & Monitor
                </button>
            {/if}
        </div>
    </div>
    {/if}

    <!-- OTP Display Modal -->
    {#if showOtpModal}
    <div class="fixed inset-0 z-[60] flex items-center justify-center bg-slate-900/60 backdrop-blur-md animate-fade-in p-6">
        <div class="bg-white rounded-3xl overflow-hidden max-w-sm w-full shadow-2xl scale-100 animate-scale-up border-[3px] border-emerald-100 text-center p-8">
            <div class="size-16 rounded-full bg-emerald-50 text-emerald-600 flex items-center justify-center mx-auto mb-6">
                <span class="material-symbols-outlined text-3xl">lock</span>
            </div>
            <h3 class="text-2xl font-black text-slate-900 mb-2">Security ID</h3>
            <p class="text-slate-500 text-sm font-medium mb-8">
                Share this release code with the driver only upon successful delivery.
            </p>
            
            <div class="bg-slate-900 text-white p-6 rounded-2xl mb-8 relative overflow-hidden group">
                <div class="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20"></div>
                <div class="text-4xl font-black tracking-[0.2em] font-mono">{currentOtp}</div>
            </div>

            <button onclick={() => showOtpModal = false} class="w-full py-4 bg-slate-100 text-slate-900 rounded-xl font-black text-xs uppercase tracking-widest hover:bg-slate-200 transition-colors">
                Back to Dashboard
            </button>
        </div>
    </div>
    {/if}
</div>
