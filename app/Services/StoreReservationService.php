<?php

namespace App\Services;

use App\Mail\ReservationReminder;
use App\Models\Reservation;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class StoreReservationService
{
    public function execute(Request $request)
    {
        $request->validate([
            'bicycle_id' => 'required',
            'date' => 'required|date',
        ]);

        $reservation = Reservation::create([
            'user_id' => $request->user()->id,
            'bicycle_id' => $request->bicycle_id,
            'date' => $request->date,
        ]);

        $reservation->user()->associate($request->user());

        $reservation->bicycle()->associate($request->bicycle_id);

        $start = Carbon::createFromFormat(
            'Y-m-d H:i:s', date('Y-m-d H:i:s', strtotime(
            $request->starts_at)));

        $when = $start->subDay();

        Mail::to($request->user())
            ->later($when, new ReservationReminder($reservation));

        return $reservation;
    }
}
