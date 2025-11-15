        <div id="noti-container" class="flex items-center justify-between bg-green-200 border border-green-500 rounded-lg text-green-700 mb-8 p-4">
            <span class="flex items-center gap-4">
                <i class="fa-solid fa-check text-xl"></i>
                <p>{{ session('success') }}</p>
            </span> 
            <button id="hide-btn" class="border border-green-500 rounded-md py-1 px-2 hover:bg-green-300">Okay</button>
        </div>
        <script>
            document.getElementById('hide-btn').addEventListener('click', () => {
                document.getElementById('noti-container').classList.add('hidden');
            })
        </script>