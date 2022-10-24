<x-app-layout>
    <div class="flex w-full justify-center p-8">
        <div class="flex flex-col justify-left w-[80%] bg-[#FAF3E3] p-8 rounded-lg">
            <form method="GET" class="flex flex-col w-[100%] bg-white rounded-sm p-4">
                @csrf
                <div class="flex justify-center p-2 gap-6">
                    <div class="flex flex-col">
                        <label for="from" class="uppercase text-[#474B8B] font-bold">No:</label>
                        <x-text-input class="from"
                                      type="date"
                                      id="from"
                                      name="from"
                                      min="{{ \Carbon\Carbon::today()->subYear() }}"
                                      max="{{\Carbon\Carbon::today()->addMonth()}}"
                                      value="{{old('from', request('from'))}}"
                                      onfocus="this.value=''"></x-text-input>
                    </div>

                    <div class="flex flex-col">
                        <label for="to" class="uppercase text-[#474B8B] font-bold">Līdz:</label>
                        <x-text-input class="to"
                                      type="date"
                                      id="to"
                                      name="to"
                                      min="{{ \Carbon\Carbon::today()->subYear()}}"
                                      max="{{\Carbon\Carbon::today()->addMonths(3)}}"
                                      value="{{old('to', request('to'))}}"
                                      onfocus="this.value=''"></x-text-input>
                    </div>

                </div>

                <div class="flex justify-center p-2 gap-4 m-0">
                    <x-primary-button onclick="
                        document.getElementById('from').value = '';
                        document.getElementById('to').value = ''">
                        Atiestatīt
                    </x-primary-button>

                    <x-primary-button>Meklēt</x-primary-button>
                    <x-primary-button formaction="/rezervacijas/drukat" formtarget="_blank">
                        Izdrukāt PDF
                    </x-primary-button>
                </div>
            </form>

            @if ($reservations->count() == 0)
                <p class="text-center text-black text-xl mt-6">
                    Šajos datumos nav reģistrēta neviena rezervācija
                </p>
            @else
                <x-table :reservations="$reservations"/>
            @endif
        </div>
    </div>
</x-app-layout>

