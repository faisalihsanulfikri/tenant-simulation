<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $table = "teacher";
    protected $primaryKey = "id";  
    public $incrementing = true;
    public $timestamps = true;
    public $remember = false;
    
    protected $dates = [
        "created_at",
        "updated_at"
    ];
    protected $fillable = [];
    protected $guarded = [];
    protected $hidden = [];
    protected $casts = [];
    protected $appends = [];
    
    public function getName(): string
    {
        return $this->name;
    }
}
