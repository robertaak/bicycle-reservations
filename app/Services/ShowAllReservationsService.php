<?php

namespace App\Services;

use App\Models\Reservation;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ShowAllReservationsService
{
    public function execute(Request $request)
    {
        $from = $request->query('from');
        $to = $request->query('to');

        if (!empty($from) && !empty($to)) {
            $reservations = Reservation::latest()
                ->whereBetween('date', [
                    Carbon::createFromFormat('Y-m-d', $from)->setTimezone('UTC')->setTime(0, 0, 0)->toDateTimeString(),
                    Carbon::createFromFormat('Y-m-d', $to)->setTimezone('UTC')->setTime(23, 59, 59)->toDateTimeString()
                ])
                ->paginate(10);
        } else {
            $reservations = Reservation::latest()->paginate(10);
        }

        return $reservations;
    }
}
