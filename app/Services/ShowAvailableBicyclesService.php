<?php

namespace App\Services;

use App\Models\BicycleType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ShowAvailableBicyclesService
{
    public function execute(Request $request, $date)
    {
        $availableBicycles=DB::SELECT("SELECT * FROM bicycles WHERE id NOT IN
                          (SELECT bicycle_id FROM reservations WHERE date = '$date')");
        $data = [];

        foreach ($availableBicycles as $bicycle) {

            $bicycleType=BicycleType::find($bicycle->bicycle_type_id);

            $data[]=['bicycle' => $bicycle, 'bicycleType' => $bicycleType];
        }

        return $data;
    }
}
