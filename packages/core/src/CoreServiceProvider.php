<?php

namespace Ameos\Core;

use Illuminate\Support\ServiceProvider;

class CoreServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->make('Ameos\Core\Http\Controllers\CalculatorController');
        $this->loadViewsFrom(__DIR__.'/views', 'core');
        $this->commands([
            Http\Console\Commands\GenerateCountries::class,
            Http\Console\Commands\GenerateLanguages::class
        ]);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //Registering Routes
        include __DIR__.'/routes.php';
    }
}
