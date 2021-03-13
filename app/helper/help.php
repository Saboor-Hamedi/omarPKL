<?php 
namespace AIS\helper;
class help{
    private $count ;
    public function __construct()
    {
        $this->count;
    }
    public function increment(){
        return ++ $this->count;
    }
    public function loadMore($text1, $limit = 200)
    {
        if(\strlen($text1) <=$limit){
            echo $text1;
        }else{
            $text1 = $text1 . "";
            $text1 = substr($text1, 0, $limit);
            $text1 = substr($text1, 0, strrpos($text1, ' '));
            $text1 = $text1 . ", ";
            return $text1;
        }
     
    }
    
}