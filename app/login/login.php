<?php

namespace AIS\login;

use Exception;

class login
{
    public $error;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getConnection()
    {
        return $this->db;
    }
    public function getError()
    {
        return  $this->error;
    }
    public function setError($error)
    {
        $this->error = $error;
    }
    public function Login($nim, $password)
    {
        try{
            $sql = "SELECT * FROM student WHERE nim  = '$nim'";
            $query = $this->getConnection()->select($sql);
            if ($query) {
                while ($row = $query->fetch_assoc()) {
                    if (password_verify($password, $row['password'])) {
                        $_SESSION["nim"] = $row["nim"];
                          header("Location: /public/view/dashboard/dashboard.php");
                        exit;
                    }else{
                         $this->error = 'Wrong password';
                    }
                }
            }else{
                 $this->error = 'ID not found';
            }
        }catch(Exception $e){
           $errors =$e->getMessage();
        }
    }
    public function validate($data)
    {
        $data = trim($data);
        $data = stripcslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
}
