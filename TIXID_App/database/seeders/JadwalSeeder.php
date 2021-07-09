<?php

namespace Database\Seeders;

use App\Models\Film;
use App\Models\Studio;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class JadwalSeeder extends Seeder
{
   /*
    *
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        ini_set('memory_limit', '-1');
        $faker = Faker::create();

        $film_ids = Film::all()->pluck('mov_id')->toArray();
        $studio_ids = Studio::all()->pluck('std_id')->toArray();

        for($i = 1; $i <= 10; $i++)
        {
            $jadwalData[] = [
                'mov_id'                => $film_ids[array_rand($film_ids)],
                'std_id'                => $studio_ids[array_rand($studio_ids)],
                'sch_waktu'             => $faker->dateTime()
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($jadwalData, 100000);
        foreach($chunks as $chunk) {
            DB::table('jadwal')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
