<?php

namespace App\Services;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ShowByUserService
{
    public function execute(Request $request)
    {
        return Reservation::latest()
            ->where('user_id', $request->user()->id)
            ->paginate(10);
    }
}
