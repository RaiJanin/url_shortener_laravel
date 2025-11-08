@extends('layouts.app')


@section('route-links')

@endsection

@section('styles')

@endsection
@section('scripts')

@endsection

@section('main-content')
<div class="flex h-full">
    <div class="flex flex-col flex-1 overflow-hidden">
        @include('components.head')
        @include('components.account-head')

        <div class="mt-29">
            @if(request()->routeIs('account') && request('section') == 'profile')
                @include('ui.profiles')
            @endif
        </div>
        @include('components.footer')
    </div>
</div>
@endsection

@section('jscripts')
    <script>
        const terminateBtn = document.getElementById('terminateBtn');
        const cancelTerminateBtn = document.getElementById('cancelTerminateBtn');
        const confirmTerminateModal = document.getElementById('confirm-terminate');
        const confirmationInput = document.getElementById('confirmationInput');
        const finalConfirmation = document.getElementById('confirm-term-btn');
        
        terminateBtn.addEventListener('click', () => {
            showConfirmationModal("Confirm Termination?", "All of your data will be deleted, proceed?", () => {
                confirmTerminateModal.classList.remove('hidden');
            });
        });

        cancelTerminateBtn.addEventListener('click', () => {
            confirmTerminateModal.classList.add('hidden');
        });

        confirmationInput.addEventListener('input', () => {
            finalConfirmation.disabled = confirmationInput.value !== 'Terminate';
        });

        window.addEventListener('click', (e) => {
            if (e.target === modal) {
                confirmTerminateModal.classList.add('hidden');
            }
        });
    </script>
@endsection

