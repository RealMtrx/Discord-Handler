# Select Menus

Select menus present a dropdown of options. Discord supports string select menus, user select menus, role select menus, and channel select menus.

## String Select Menu

```javascript
import { ActionRowBuilder, StringSelectMenuBuilder } from 'discord.js';

const menu = new StringSelectMenuBuilder()
  .setCustomId('roles')
  .setPlaceholder('Choose a role')
  .setMinValues(1)
  .setMaxValues(3)
  .addOptions([
    { label: 'Developer', value: 'dev', description: 'Get the developer role', emoji: '💻' },
    { label: 'Designer', value: 'design', description: 'Get the designer role', emoji: '🎨' },
    { label: 'Writer', value: 'write', description: 'Get the writer role', emoji: '✍️' },
  ]);

const row = new ActionRowBuilder().addComponents(menu);
```

## User Select Menu

```javascript
import { ActionRowBuilder, UserSelectMenuBuilder } from 'discord.js';

const userMenu = new UserSelectMenuBuilder()
  .setCustomId('mention')
  .setPlaceholder('Select a user')
  .setMinValues(1)
  .setMaxValues(1);
```

## Role Select Menu

```javascript
import { ActionRowBuilder, RoleSelectMenuBuilder } from 'discord.js';

const roleMenu = new RoleSelectMenuBuilder()
  .setCustomId('assign_role')
  .setPlaceholder('Assign a role');
```

## Handling Selections

```javascript
client.on('interactionCreate', async interaction => {
  if (!interaction.isAnySelectMenu()) return;

  if (interaction.customId === 'roles') {
    await interaction.reply(`You selected: ${interaction.values.join(', ')}`);
  }
});
```

## Default Values

You can pre-select values by passing an array of option values:

```javascript
const menu = new StringSelectMenuBuilder()
  .setCustomId('preset')
  .setPlaceholder('Choose options')
  .addOptions(options)
  .setDefaultValues(['opt1', 'opt3']);
```
