<?php

namespace Tests\Feature;

use Tests\TestCase;

class AuthenticationTest extends TestCase
{
    public function test_login_screen_can_be_rendered()
    {
        $response = $this->get('/ienakt');

        $response->assertStatus(200);
    }

    public function test_users_can_authenticate_using_the_login_screen()
    {
        $response = $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => '12345678',
        ]);

        $this->assertAuthenticated();
        $response->assertRedirect('/rezervacijas/izveidot');
    }

    public function test_users_can_not_authenticate_with_invalid_password()
    {
        $this->post('/ienakt', [
            'email' => 'darbinieks1@uznemums.lv',
            'password' => 'wrong-password',
        ]);

        $this->assertGuest();
    }
}
