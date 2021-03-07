<?php

namespace App\Utilities\Log;


class Log
{

  /*
    emergency, alert, critical, error, 
    warning, notice, info, debug  
  */ 

  private $appName;
  private $appEnvironment;
  private $client;

  private $message;

  public function __construct($message = null)
  {
    if ($message !== null) {
      $this->setMessage($message);
    }    
    $this->setDefaultData();
    $this->setDefaultClient();
  }

  public function setMessage($message): Log 
  {
    $this->message = $message;
    return $this;
  }

  public function critical(): Log
  {
    if ($this->hasMessage()) {
      $this->client->critical('[' . $this->appName . '] ' . $this->message);
    }
    return $this;
  }

  public function info(): Log
  {
    if ($this->hasMessage()) {
      $this->client->info('[' . $this->appName . '] ' . $this->message);
    }
    return $this;
  }

  public function setEnvironment($env): Log
  {
    $this->appEnvironment = $env;
    return $this;
  }
  
  private function setDefaultData(): Log
  {
    $this->appName = env('APP_NAME');
    $this->appEnvironment = env('APP_ENV');    
    return $this;
  }

  public function setDefaultClient(): Log
  {
    if (in_array($this->appEnvironment, ['production', 'development'])) {
      $this->client = LaravelLog::channel('production');
    }
    else {
      $this->client = LaravelLog::channel('stack');
    }
    return $this;
  }

  private function hasMessage(): bool
  {
    return isset($this->message) && !empty($this->message);
  }

}