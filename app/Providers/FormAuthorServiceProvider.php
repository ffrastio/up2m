<?php

namespace App\Providers;

use App\Models\Jurusan;
use App\Models\Prodi;
use Illuminate\Support\ServiceProvider;

class FormAuthorServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('pages.author.form', function ($view) {
            $view->with('list_jurusan', Jurusan::pluck('nama_jurusan', 'id'));
            $view->with('list_prodi', Prodi::pluck('nama_prodi', 'id'));
        });
    }
}
