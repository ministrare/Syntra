<?php

// You may consider this as a blueprint that only will be accessable if object is initialized
class db_connect
{
    // This propertie can be changed from outside of the class
    public $host;
    // This propertie can be changed from a extended class or within the class
    protected $db;
    // This propertie can only be changed by a function inside the class
    private $user, $pass;
}

// Extends the DB_CONNECT class to gain access to the protected properties
class db_connect_alternative extends db_connect
{
    // This function is to access the protected propertie to override its value
    public function setDB($value)
    {
        $this->db = $value;
    }

    // This function returns the value stored in the db propertie
    public function getDB()
    {
        return $this->db;
    }
}