<?php

namespace Database\Seeders;

use App\Models\Voucher;
use App\Models\Transaksi;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class DetailVoucherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // ini_set('memory_limit', '-1');
        $faker = Faker::create();

        $Voucher_ids = Voucher::all()->pluck('voc_id')->toArray();
        $Transaksi_ids = Transaksi::all()->pluck('trx_id')->toArray();

        for($i = 1; $i <= 10; $i++)
        {
            $detailVoucherData[] = [
                'trx_id'                => $Transaksi_ids[array_rand($Transaksi_ids)],
                'voc_id'                => $Voucher_ids[array_rand($Voucher_ids)]
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($detailVoucherData, 100000);
        foreach($chunks as $chunk) {
            DB::table('detail_voucher')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
