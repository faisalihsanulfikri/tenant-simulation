<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    protected $table = "school";
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

    public function hasDBPassword(): bool
    {
        return $this->db_password != null;
    }
    
    public function getSchoolName(): string
    {
        return $this->school_name;
    }

    public function getDBName(): string
    {
        return $this->db_name;
    }

    public function getDBUsername(): string
    {
        return $this->db_username;
    }

    public function getDBPassword(): string
    {
        if ($this->hasDBPassword()) {
            return $this->db_password;
        }
        return '';
    }
}
