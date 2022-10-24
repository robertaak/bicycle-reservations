<?php

use App\Http\Controllers\ReservationController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
})->middleware('guest');

Route::get('/rezervacijas', [ReservationController::class, 'index'])
    ->middleware('auth');

Route::get('/rezervacijas/drukat', [ReservationController::class, 'printPDF'])
    ->middleware('auth');

Route::get('/rezervacijas/izveidot', [ReservationController::class, 'create'])
    ->middleware('auth')
    ->name('izveidot');

Route::post('/rezervacijas', [ReservationController::class, 'store'])
    ->middleware('auth')
    ->name('grafiks');

Route::get('/rezervacijas/lietotajs/{id}', [ReservationController::class, 'showByUser'])
    ->middleware('auth');

Route::delete('/rezervacijas/{id}/atcelt', [ReservationController::class, 'destroy'])
    ->middleware('auth');

Route::get('/rezervacijas/pieej/{date}', [ReservationController::class, 'availableBicycles'])
    ->middleware('auth');

Route::get('/mailable/{id}', function () {

    $reservation = App\Models\Reservation::findOrFail(request()->id);

    return new App\Mail\ReservationReminder($reservation);
});

require __DIR__.'/auth.php';
