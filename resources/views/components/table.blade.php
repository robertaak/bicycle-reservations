@props(['reservations'])
<table class="text-center mt-4 border border-slate-400 bg-white">
    <tr class="text-center text-l bg-[#474B8B] text-white uppercase h-10">
        <th class="p-4 border border-slate-300">Nr.</th>
        <th class="p-4 border border-slate-300">Vārds Uzvārds</th>
        <th class="p-4 border border-slate-300">Velosipēda Nr.</th>
        <th class="p-4 border border-slate-300">Velosipēds</th>
        <th class="p-4 border border-slate-300">Datums:</th>
    </tr>
    @foreach($reservations as $reservation)
        <tr>
            <td class="p-4 border border-slate-300">{{$reservation->id}}</td>
            <td class="p-4 border border-slate-300 uppercase">{{$reservation->user->name}}</td>
            <td class="p-4 border border-slate-300">{{$reservation->bicycle->id}}</td>
            <td class="p-4 border border-slate-300">{{$reservation->bicycle->bicycleType->type}}</td>
            <td class="p-4 border border-slate-300">{{$reservation->date}}</td>
        </tr>
    @endforeach
</table>
{{ $reservations->links() }}
