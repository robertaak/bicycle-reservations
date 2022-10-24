<?php

namespace App\Services;

use App\Models\Reservation;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class PrintPDFService
{
    public function execute(Request $request)
    {
        $from = $request->query('from');
        $to = $request->query('to');

        if (!empty($from) && !empty($to)) {
            $reservations = Reservation::all()
                ->whereBetween('date', [$from, $to]);
        } else {
            $reservations = Reservation::all();
        }

        $pdf = PDF::loadView('pdf', ['reservations' => $reservations]);

        return $pdf->stream('rezervacijas.pdf');
    }
}
