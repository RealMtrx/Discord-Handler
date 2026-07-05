# Modals

Modals are pop-up forms that collect structured input from users. They can contain multiple text inputs.

## Creating a Modal

```javascript
import { ModalBuilder, TextInputBuilder, TextInputStyle, ActionRowBuilder } from 'discord.js';

const modal = new ModalBuilder()
  .setCustomId('suggestion')
  .setTitle('Submit a Suggestion');

const titleInput = new TextInputBuilder()
  .setCustomId('title')
  .setLabel('Suggestion Title')
  .setStyle(TextInputStyle.Short)
  .setPlaceholder('Enter a brief title')
  .setRequired(true)
  .setMaxLength(100);

const descriptionInput = new TextInputBuilder()
  .setCustomId('description')
  .setLabel('Description')
  .setStyle(TextInputStyle.Paragraph)
  .setPlaceholder('Describe your suggestion in detail')
  .setRequired(true)
  .setMaxLength(1000);

const firstRow = new ActionRowBuilder().addComponents(titleInput);
const secondRow = new ActionRowBuilder().addComponents(descriptionInput);
modal.addComponents(firstRow, secondRow);

await interaction.showModal(modal);
```

## Handling Modal Submissions

```javascript
client.on('interactionCreate', async interaction => {
  if (!interaction.isModalSubmit()) return;

  if (interaction.customId === 'suggestion') {
    const title = interaction.fields.getTextInputValue('title');
    const description = interaction.fields.getTextInputValue('description');

    await interaction.reply({
      content: `Your suggestion has been submitted!\n**Title:** ${title}\n**Description:** ${description}`,
      ephemeral: true,
    });
  }
});
```

## Text Input Styles

| Style    | Value | Lines     |
| -------- | ----- | --------- |
| Short    | 1     | Single    |
| Paragraph| 2     | Multiple  |

## Input Properties

| Property      | Description                            |
| ------------- | -------------------------------------- |
| `customId`    | Unique identifier for the input field  |
| `label`       | Visible label above the input          |
| `style`       | Short or Paragraph                     |
| `placeholder` | Ghost text inside the input            |
| `value`       | Pre-filled default value               |
| `required`    | Whether the field must be filled       |
| `minLength`   | Minimum character count                |
| `maxLength`   | Maximum character count                |

## Use Cases

- Feedback forms
- Suggestion boxes
- Application forms
- Configuration wizards
- Report submissions
