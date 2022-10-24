<?php

namespace App\Http\Controllers;

use App\Services\DeleteReservationService;
use App\Services\PrintPDFService;
use App\Services\ShowAllReservationsService;
use App\Services\ShowAvailableBicyclesService;
use App\Services\ShowByUserService;
use App\Services\ShowReservationService;
use App\Services\StoreReservationService;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    public function index(Request $request, ShowAllReservationsService $showAllReservationsService)
    {
        $reservations = $showAllReservationsService->execute($request);

        return view('index', [
            'reservations' => $reservations
        ]);
    }

    public function create()
    {
        return view('create');
    }

    public function store(Request $request, StoreReservationService $storeReservationService)
    {
        $storeReservationService->execute($request);

        return redirect("/rezervacijas/");
    }

    public function showByUser(Request $request, ShowByUserService $showByUserService)
    {
        $reservations = $showByUserService->execute($request);

        return view('showByUser', [
            'reservations' => $reservations
        ]);
    }

    public function destroy($id, Request $request, DeleteReservationService $deleteReservationService)
    {
        $deleteReservationService->execute($id, $request);
        return redirect('/');
    }

    function availableBicycles(Request $request, $date, ShowAvailableBicyclesService $showAvailableBicycles)
    {
        $data = $showAvailableBicycles->execute($request, $date);
        return response()->json(['data' => $data]);
    }

    public function printPDF(Request $request, PrintPDFService $printPDFService)
    {
        return $printPDFService->execute($request);
    }
}
