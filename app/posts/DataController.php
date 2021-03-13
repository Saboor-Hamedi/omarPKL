<?php

namespace AIS\posts;

class DataController
{
    protected $id;
    protected $db;
    public function __construct($db)
    {

        $this->db = $db;
    }
    public function getConnection()
    {

        return $this->db;
    }
    public function Fetch($table)
    {
        $id = $_SESSION['nim'];
        $result = array();
        $sql = "SELECT nim, name, lastname, address, email, age, country FROM " . "$table " . "WHERE nim = " . "$id";
        $post = $this->getConnection()->select($sql);
        while ($row = $post->fetch_assoc()) {
            $result[] = $row;
        }
        return $result;
    }
    public function FetchData($table)
    {
        $result = array();
        $sql = "SELECT * FROM " . $table;
        $post = $this->getConnection()->link->query($sql);
        while ($row = $post->fetch_assoc()) {
            $result[] = $row;
        }
        return $result;
    }
    // $table, $student_id
    public function countStudent()
    {
        $id = $_SESSION['nim'];
        $result = array();
        // $sql = 'SELECT *, COUNT(student_id) AS countLetters FROM agency ' . $table . ' WHERE ' . $student_id . ' = ' . $id;
        $sql = 'SELECT COUNT(*),(SELECT COUNT(*) FROM recommendationletter ) FROM agency ';
        $post = $this->getConnection()->link->query($sql);
        while ($row = $post->fetch_assoc()) {
            $result[] = $row;
        }
        return $result;
    }
    public function fetchLetter($table, $student_id)
    {
        $id = $_SESSION['nim'];
        $result = array();
        $sql = 'SELECT * FROM ' . $table . ' WHERE ' . $student_id . ' = ' . $id;
        $post = $this->getConnection()->link->query($sql);
        while ($row = $post->fetch_assoc()) {
            $result[] = $row;
        }
        return $result;
    }
}
