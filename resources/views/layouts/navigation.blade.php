<nav x-data="{ open: false }" class="bg-[#FAF3E3] border-b border-gray-100">
{{--    <!-- Primary Navigation Menu -->--}}
    <div class="max-w-[100%] mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-24">
            <div class="flex">
                <!-- Navigation Links -->
                <div class="hidden space-x-4 sm:-my-px sm:ml-10 sm:flex">

                    <x-nav-link :href="route('izveidot')" :active="request()->is('rezervacijas/izveidot')">
                        {{ __('Veikt rezervāciju') }}
                    </x-nav-link>

                    <x-nav-link :href="route('grafiks')" :active="request()->is('rezervacijas')">
                        {{ __('Rezervāciju grafiks') }}
                    </x-nav-link>

                    <x-nav-link href="/rezervacijas/lietotajs/{{Auth::user()->id}}" :active="request()->is('rezervacijas/lietotajs/'.Auth::user()->id)">
                        {{ __('Manas rezervācijas') }}
                    </x-nav-link>

                </div>
            </div>

            <!-- Settings Dropdown -->
            <div class="hidden sm:flex sm:items-center sm:ml-6">
                <x-dropdown align="right" width="48">
                    <x-slot name="trigger">
                        <button class="flex items-center text-lg font-medium text-gray-900 hover:text-gray-700 hover:border-gray-300 focus:outline-none focus:text-gray-700 focus:border-gray-300 transition duration-150 ease-in-out">
                            <div>{{ Auth::user()->name }}</div>

                            <div class="ml-1">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                </svg>
                            </div>
                        </button>
                    </x-slot>

                    <x-slot name="content">
                        <!-- Authentication -->
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf

                            <x-dropdown-link :href="route('logout')"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                                {{ __('Iziet') }}
                            </x-dropdown-link>
                        </form>
                    </x-slot>
                </x-dropdown>
            </div>
        </div>
    </div>
</nav>
