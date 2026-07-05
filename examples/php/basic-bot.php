<?php

require 'vendor/autoload.php';

use Discord\Discord;
use Discord\WebSockets\Event;
use Discord\Builders\MessageBuilder;

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad();

$token = $_ENV['TOKEN'];
$prefix = $_ENV['PREFIX'] ?? '!';

$discord = new Discord(['token' => $token]);

$discord->on(Event::READY, function (Discord $discord) {
  echo "Logged in as {$discord->user->username}" . PHP_EOL;

  $command = new \Discord\Parts\Interactions\Command\Command($discord, [
    'name' => 'ping',
    'description' => 'Replies with Pong!',
    'type' => \Discord\Parts\Interactions\Command\Command::CHAT_INPUT,
  ]);

  $discord->application->commands->save($command)->done(function () {
    echo "Slash command registered" . PHP_EOL;
  });
});

$discord->on(Event::INTERACTION_CREATE, function ($interaction) {
  if ($interaction->type === \Discord\Parts\Interactions\Interaction::TYPE_APPLICATION_COMMAND) {
    if ($interaction->data->name === 'ping') {
      $interaction->respond(MessageBuilder::new()->setContent('Pong!'));
    }
  }
});

$discord->on(Event::MESSAGE_CREATE, function ($message) use ($discord, $prefix) {
  if ($message->author->bot) return;

  $content = $message->content;
  if (!str_starts_with($content, $prefix)) return;

  $args = explode(' ', substr($content, strlen($prefix)));
  if (empty($args[0])) return;

  if ($args[0] === 'ping') {
    $discord->client->sendMessage($message->channel_id, ['content' => 'Pong!']);
  }
});

$discord->run();
