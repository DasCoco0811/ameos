<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        $user = \Ameos\Core\Http\Models\User::create([
            'sec_id' => 1,
            'level_id' => 1,
            'country_id' => 1,
            'language_id' => 1,
            'fullname' => 'Kim Sebastian Kornwinkel',
            'username' => 'TheKimbo',
            'email' => 'kornwinkel.kim@gmail.com',
            'password' => bcrypt('password'),
            'phonenumber' => '+4917668645637',
            'experience' => 500
        ]);

        $user->save();

        $user2 = \Ameos\Core\Http\Models\User::create([
            'sec_id' => 2,
            'level_id' => 2,
            'country_id' => 2,
            'language_id' => 2,
            'fullname' => 'Connor Nagy',
            'username' => 'DasCoco',
            'email' => 'mck.dascoco@gmail.com',
            'password' => bcrypt('password'),
            'phonenumber' => '+4917646146366',
            'experience' => 500
        ]);

        $user2->save();

        //\Artisan::call('ameos:generate:languages');
        //\Artisan::call('ameos:generate:countries');
    }
}
