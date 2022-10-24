<?php

namespace Tests\Feature;

use App\Models\Reservation;
use Carbon\Carbon;
use Tests\TestCase;

class ReservationsTest extends TestCase
{

    public function test_create_reservations_screen_can_be_rendered()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();

        $response = $this->get('/rezervacijas/izveidot');

        $response->assertStatus(200);
    }

    public function test_create_reservations_screen_can_not_be_rendered_for_guests()
    {
        $this->assertGuest();

        $response = $this->get('/rezervacijas/izveidot');

        $response->assertRedirect('/ienakt');
    }

    public function test_all_reservations_screen_is_rendered()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();

        $response = $this->get('/rezervacijas');

        $response->assertStatus(200);
    }

    public function test_users_can_create_reservation_using_the_create_reservations_screen()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);
        $this->assertAuthenticated();

        $response = $this->post('/rezervacijas', [
                'bicycle_id' => 1,
                'user_id' => 5,
                'date' => '2022-09-22',
        ]);

        $response->assertRedirect("/rezervacijas");
    }


    public function test_reservations_can_not_be_deleted_by_another_user()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks2@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();

        $id = Reservation::latest()->first()->id;

        $response = $this->delete("/rezervacijas/$id/atcelt");

        $response->assertRedirect('/');

        $this->assertDatabaseHas('reservations', ['id' => $id, 'deleted_at' => null]);

    }

    public function test_reservations_can_be_deleted()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();

        $id = Reservation::latest()->first()->id;

        $response = $this->delete("/rezervacijas/$id/atcelt");

        $response->assertRedirect('/');

    }

    public function test_users_can_print_reservations_list_as_pdf()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();

        $response = $this->get('/rezervacijas/drukat');
        $response->assertStatus(200);
    }
}
