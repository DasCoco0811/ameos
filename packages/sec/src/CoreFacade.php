<?php

namespace Ameos\Core;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Ameos\Core\Skeleton\SkeletonClass
 */
class CoreFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'core';
    }
}