<?php
require_once __DIR__ . '/../vendor/autoload.php';


use PHPUnit\Framework\TestCase;
use App\App;
class AppTest extends TestCase {
    public function testHello() {
        $app = new App();
        $this->assertEquals("Olá mundo!", $app->hello());
    }
}
