<?php

namespace App\Services;

use App\Models\Reservation;
use Illuminate\Http\Request;

class DeleteReservationService
{
    public function execute($id, Request $request)
    {
        $reservation = Reservation::findOrFail($id);

        if ($reservation->user_id !== $request->user()->id) {
            return back();
        }

        return Reservation::where('id', $id)->delete();

    }
}
