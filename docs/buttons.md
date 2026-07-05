# Buttons

Buttons are interactive message components. They can have different styles and can be enabled or disabled.

## Button Styles

| Style      | Value | Appearance     |
| ---------- | ----- | -------------- |
| Primary    | 1     | Blurple        |
| Secondary  | 2     | Grey           |
| Success    | 3     | Green          |
| Danger     | 4     | Red            |
| Link       | 5     | Grey (opens URL) |

## Creating a Button

```javascript
import { ButtonBuilder, ButtonStyle, ActionRowBuilder } from 'discord.js';

const confirm = new ButtonBuilder()
  .setCustomId('confirm')
  .setLabel('Confirm')
  .setStyle(ButtonStyle.Success);

const cancel = new ButtonBuilder()
  .setCustomId('cancel')
  .setLabel('Cancel')
  .setStyle(ButtonStyle.Danger);

const row = new ActionRowBuilder().addComponents(confirm, cancel);
```

## Handling Button Clicks

```javascript
client.on('interactionCreate', async interaction => {
  if (!interaction.isButton()) return;

  switch (interaction.customId) {
    case 'confirm':
      await interaction.update({ content: 'Confirmed!', components: [] });
      break;
    case 'cancel':
      await interaction.update({ content: 'Cancelled.', components: [] });
      break;
  }
});
```

## Disabled Buttons

Buttons can be disabled to prevent interaction:

```javascript
const button = new ButtonBuilder()
  .setCustomId('locked')
  .setLabel('Locked')
  .setStyle(ButtonStyle.Secondary)
  .setDisabled(true);
```

## Link Buttons

Link buttons do not send an interaction event. They simply open a URL:

```javascript
const link = new ButtonBuilder()
  .setLabel('Documentation')
  .setURL('https://docs.example.com')
  .setStyle(ButtonStyle.Link);
```
