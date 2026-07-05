package main

import (
  "fmt"
  "os"
  "os/signal"
  "strings"
  "syscall"

  "github.com/bwmarrin/discordgo"
  "github.com/joho/godotenv"
)

func main() {
  godotenv.Load()
  token := os.Getenv("TOKEN")
  prefix := os.Getenv("PREFIX")
  if prefix == "" {
    prefix = "!"
  }

  dg, err := discordgo.New("Bot " + token)
  if err != nil {
    fmt.Println("Error creating session:", err)
    return
  }

  dg.AddHandler(func(s *discordgo.Session, r *discordgo.Ready) {
    fmt.Println("Bot is ready as", s.State.User.Username)
    s.AddHandler(func(s *discordgo.Session, i *discordgo.InteractionCreate) {
      if i.ApplicationCommandData().Name == "ping" {
        s.InteractionRespond(i.Interaction, &discordgo.InteractionResponse{
          Type: discordgo.InteractionResponseChannelMessageWithSource,
          Data: &discordgo.InteractionResponseData{Content: "Pong!"},
        })
      }
    })
  })

  dg.AddHandler(func(s *discordgo.Session, m *discordgo.MessageCreate) {
    if m.Author.Bot { return }
    if !strings.HasPrefix(m.Content, prefix) { return }

    args := strings.Fields(strings.TrimPrefix(m.Content, prefix))
    if len(args) == 0 { return }

    switch strings.ToLower(args[0]) {
    case "ping":
      s.ChannelMessageSend(m.ChannelID, "Pong!")
    }
  })

  dg.Identify.Intents = discordgo.IntentsAllWithoutPrivileged | discordgo.Intents.MessageContent

  err = dg.Open()
  if err != nil {
    fmt.Println("Error opening connection:", err)
    return
  }

  fmt.Println("Bot is running. Press CTRL+C to exit.")
  sc := make(chan os.Signal, 1)
  signal.Notify(sc, syscall.SIGINT, syscall.SIGTERM)
  <-sc
  dg.Close()
}
