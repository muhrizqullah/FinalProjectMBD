<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class BioskopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ini_set('memory_limit', '-1');

        $faker = Faker::create();

        for($i = 1; $i <= 100; $i++)
        {
            $bioskopData[] = [
                'cin_nama'      => $faker->company(),
                'cin_lokasi'    => $faker->streetAddress()
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($bioskopData, 100000);
        foreach($chunks as $chunk) {
            DB::table('bioskop')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
