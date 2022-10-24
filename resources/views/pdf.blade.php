<!DOCTYPE html>
<html lang="lv">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/app.css"/>
    <title>Rezervāciju izdruka</title>
</head>
<body>
<h1 style="
        font-family: firefly, DejaVu Sans, sans-serif;
        text-align: center;
        ">Rezervāciju saraksts</h1>
    <table style="
        font-family: firefly, DejaVu Sans, sans-serif;
        border: 1px solid rgb(148 163 184);
        border-collapse: collapse;
        font-size: x-small;
        ">
        <tr style="
            background-color: #474B8B;
            color: white;
            text-transform: uppercase;
            ">
            <th style="border: 1px solid white">Nr.</th>
            <th style="border: 1px solid white">Vārds Uzvārds</th>
            <th style="border: 1px solid white">Velosipēda Nr.</th>
            <th style="border: 1px solid white">Velosipēds</th>
            <th style="border: 1px solid white">Datums:</th>
        </tr>
        @foreach($reservations as $reservation)
            <tr style="
            border: 1px solid rgb(148 163 184);
            text-align: center;
            ">
                <td>{{$reservation->id}}</td>
                <td style="text-transform: uppercase">{{$reservation->user->name}}</td>
                <td>{{$reservation->bicycle->id}}</td>
                <td>{{$reservation->bicycle->bicycleType->type}}</td>
                <td>{{$reservation->date}}</td>
            </tr>
        @endforeach
    </table>
</body>
</html>


