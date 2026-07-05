use serenity::all::*;
use serenity::prelude::*;
use std::env;

struct Handler;

#[serenity::async_trait]
impl EventHandler for Handler {
  async fn ready(&self, ctx: Context, ready: Ready) {
    println!("Logged in as {}", ready.user.name);

    let command = CreateCommand::new("ping").description("Replies with Pong!");
    Command::create_global_command(&ctx.http, command).await.unwrap();
  }

  async fn interaction_create(&self, ctx: Context, interaction: Interaction) {
    if let Some(command) = interaction.as_command() {
      if command.data.name == "ping" {
        command.create_response(&ctx.http, CreateInteractionResponse::Message(
          CreateInteractionResponseMessage::new().content("Pong!"),
        )).await.unwrap();
      }
    }
  }

  async fn message(&self, ctx: Context, msg: Message) {
    if msg.author.bot { return; }

    let prefix = env::var("PREFIX").unwrap_or_else(|_| "!".to_string());
    if !msg.content.starts_with(&prefix) { return; }

    let args: Vec<&str> = msg.content[prefix.len()..].split_whitespace().collect();
    if args.is_empty() { return; }

    match args[0] {
      "ping" => { msg.channel_id.say(&ctx.http, "Pong!").await.unwrap(); }
      _ => {}
    }
  }
}

#[tokio::main]
async fn main() {
  dotenv::dotenv().ok();
  let token = env::var("TOKEN").expect("Expected TOKEN in environment");

  let intents = GatewayIntents::all();
  let mut client = Client::builder(&token, intents)
    .event_handler(Handler)
    .await
    .expect("Error creating client");

  if let Err(e) = client.start().await {
    println!("Client error: {:?}", e);
  }
}
