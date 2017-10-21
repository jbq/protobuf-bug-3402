<?php

declare(strict_types=1);

require "vendor/autoload.php";

class CrashCommand
{
    public function execute() {
        $b = new \Com\B();
        $a = new Com\A();
        $a->setStr("hello");
        $b->setJsonBodyReq("world");
        $b->setA($a);
        $str = $b->serializeToString();

        $b = new \Com\B();
        $b->mergeFromString($str);
        var_dump($b->getA()->getStr());
    }
}

(new CrashCommand())->execute();
