# Components

Message components add interactivity to your bot's messages. Discord Handler supports buttons, select menus, and modals.

## Button

Buttons are interactive elements that trigger an interaction when clicked.

```javascript
import { ActionRowBuilder, ButtonBuilder, ButtonStyle } from 'discord.js';

const button = new ButtonBuilder()
  .setCustomId('primary')
  .setLabel('Click Me')
  .setStyle(ButtonStyle.Primary);

const row = new ActionRowBuilder().addComponents(button);

await interaction.reply({ content: 'Here is a button:', components: [row] });
```

## Select Menu

Select menus provide a dropdown of options for users to choose from.

```javascript
import { ActionRowBuilder, StringSelectMenuBuilder } from 'discord.js';

const select = new StringSelectMenuBuilder()
  .setCustomId('select')
  .setPlaceholder('Choose an option')
  .addOptions([
    { label: 'Option 1', value: 'opt1' },
    { label: 'Option 2', value: 'opt2' },
    { label: 'Option 3', value: 'opt3' },
  ]);

const row = new ActionRowBuilder().addComponents(select);
```

## Modal

Modals are pop-up forms that collect structured input.

```javascript
import { ModalBuilder, TextInputBuilder, TextInputStyle, ActionRowBuilder } from 'discord.js';

const modal = new ModalBuilder()
  .setCustomId('feedback')
  .setTitle('Submit Feedback');

const input = new TextInputBuilder()
  .setCustomId('message')
  .setLabel('Your feedback')
  .setStyle(TextInputStyle.Paragraph);

const row = new ActionRowBuilder().addComponents(input);
modal.addComponents(row);

await interaction.showModal(modal);
```

## Handling Component Interactions

All component interactions are handled through the `interactionCreate` event, using the same pattern as slash commands.

```javascript
client.on('interactionCreate', async interaction => {
  if (interaction.isButton()) {
    if (interaction.customId === 'primary') {
      await interaction.reply({ content: 'Button clicked!', ephemeral: true });
    }
  }

  if (interaction.isStringSelectMenu()) {
    await interaction.reply(`You selected: ${interaction.values[0]}`);
  }

  if (interaction.isModalSubmit()) {
    await interaction.reply(`Feedback received: ${interaction.fields.getTextInputValue('message')}`);
  }
});
```
