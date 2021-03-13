<?php 
namespace AIS\database;
class database{
	private $host   = DB_HOST;
	private $user   = DB_USER;
	private $pass   = DB_PASS;
	private $dbname = DB_NAME;
	public $link ;
	public $error;
	public function __construct(){
		$this->connectDB();
	}
	private function connectDB(){
	try{
		mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
		$this->link =  @mysqli_connect($this->host, $this->user, $this->pass, $this->dbname);
		if(!$this->link){
			// $this->error ="Connection fail".$this->link->connect_error;
			return false;
		}
	}catch(mysqli_sql_exception $e){
		die("Unfortunately, the details you entered for connection are incorrect!");

	}
 }
	// Select or Read data
	public function select($query){
		$result = $this->link->query($query) or die($this->link->error.__LINE__);
		if($result->num_rows > 0){
			return $result;
		} else {
			return false;
		}
	}

	// Insert data
	public function insert($query){
	$insert_row = $this->link->query($query) or die($this->link->error.__LINE__);
	if($insert_row){
		return $insert_row;
	} else {
		return false;
	}
  }
  
    // Update data
  	public function update($query){
	$update_row = $this->link->query($query) or die($this->link->error.__LINE__);
	if($update_row){
		return $update_row;
	} else {
		return false;
	}
  }
  
  // Delete data
   public function delete($query){
	$delete_row = $this->link->query($query) or die($this->link->error.__LINE__);
	if($delete_row){
		return $delete_row;
	} else {
		return false;
	}
  }

 
 
}