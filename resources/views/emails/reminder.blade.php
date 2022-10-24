<x-guest-layout>
    <div class="text-center m-10 flex justify-center">
        <div class="bg-[#FAF3E3] w-[50%] flex flex-col justify-center rounded-lg p-8">
            <div class="bg-white rounded-sm p-8">
                <h1 class="uppercase text-[#474B8B] font-bold text-xl mb-4 text-center">Atgādinām, ka Jūs esat rezervējis/usi elektrisko velosipēdu!</h1>
                <h1 class="uppercase text-[#474B8B] font-bold text-xl mb-4 text-center">Rezervācijas detaļas:</h1>
                <div class="m-8 text-left">
                    <div>Nr: {{$reservation->id}}</div>
                    <div>{{$reservation->user->name}}</div>
                    <div>{{$reservation->bicycle->bicycleType->type}}</div>
                    <div>Datums: {{$reservation->date}}</div>
                    <div>Lietotāja e-pasts: {{$reservation->user->email}}</div>
                </div>
                <form action="/rezervacijas/{{$reservation->id}}/atcelt" method="POST">
                    @csrf
                    @method('DELETE')
                    <x-primary-button>ATCELT</x-primary-button>
                </form>
            </div>
        </div>
    </div>

</x-guest-layout>
