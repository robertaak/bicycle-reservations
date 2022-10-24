<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BicycleType extends Model
{
    public function bicycle(): HasMany
    {
        return $this->hasMany(Bicycle::class);
    }
}
