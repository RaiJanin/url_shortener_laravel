        <div id="noti-container" class="flex items-center justify-between bg-red-200 border border-red-500 rounded-lg text-red-700 mb-8 p-4">
            <span class="flex items-center gap-4">
                <i class="fa-solid fa-triangle-exclamation text-xl"></i>
                <ul class="list-disc pl-5">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </span>
            <button id="hide-btn" class="border border-red-500 rounded-md py-1 px-2 hover:bg-red-300">Okay</button> 
        </div>
        <script>
            document.getElementById('hide-btn').addEventListener('click', () => {
                document.getElementById('noti-container').classList.add('hidden');
            })
        </script>