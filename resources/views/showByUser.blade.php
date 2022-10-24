<x-app-layout>
    <div class="flex justify-center p-8">
        <div class="flex flex-col justify-center w-[80%] bg-[#FAF3E3] p-8 rounded-lg">
            <div  class="flex w-full justify-center">
                @if ($reservations->count() == 0)
                    <p class="uppercase text-[#474B8B] font-bold">Jūs vēl neesat veicis nevienu rezervāciju</p>
                @else
                    <x-table :reservations="$reservations"/>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
