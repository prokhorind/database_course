import telebot
import logic_layer

# Замініть на свій токен
API_TOKEN = ''
bot = telebot.TeleBot(API_TOKEN)

# Стан користувача (спрощено)
user_states = {}

@bot.message_handler(commands=['start'])
def start_handler(message):
    bot.send_message(message.chat.id, "👮 Officer Management Bot\nChoose a command:\n" +
                     "/add - Add Officer\n" +
                     "/view - View All Officers\n" +
                     "/search - Search Officer\n" +
                     "/update - Update Officer\n" +
                     "/delete - Delete Officer")

@bot.message_handler(commands=['add'])
def add_handler(message):
    msg = bot.send_message(message.chat.id, "Enter officer name:")
    bot.register_next_step_handler(msg, ask_badge_number)

def ask_badge_number(message):
    user_states[message.chat.id] = {'name': message.text}
    msg = bot.send_message(message.chat.id, "Enter badge number:")
    bot.register_next_step_handler(msg, save_officer)

def save_officer(message):
    data = user_states.get(message.chat.id, {})
    name = data.get('name')
    badge = message.text
    officer_id = logic_layer.create_officer_logic(name, badge)
    bot.send_message(message.chat.id, f"✅ Officer added with ID: {officer_id}")

@bot.message_handler(commands=['view'])
def view_handler(message):
    officers = logic_layer.read_officers_logic()
    if officers:
        response = "\n".join([f"ID: {o[0]}, Name: {o[1]}, Badge: {o[2]}" for o in officers])
    else:
        response = "No officers found."
    bot.send_message(message.chat.id, response)

@bot.message_handler(commands=['search'])
def search_handler(message):
    msg = bot.send_message(message.chat.id, "Enter name or badge number to search:")
    bot.register_next_step_handler(msg, perform_search)

def perform_search(message):
    officers = logic_layer.search_officer_logic(message.text)
    if officers:
        response = "\n".join([f"ID: {o[0]}, Name: {o[1]}, Badge: {o[2]}" for o in officers])
    else:
        response = "No matching officer found."
    bot.send_message(message.chat.id, response)

@bot.message_handler(commands=['update'])
def update_handler(message):
    msg = bot.send_message(message.chat.id, "Enter officer ID to update:")
    bot.register_next_step_handler(msg, ask_new_name)

def ask_new_name(message):
    user_states[message.chat.id] = {'id': message.text}
    msg = bot.send_message(message.chat.id, "Enter new name:")
    bot.register_next_step_handler(msg, ask_new_badge)

def ask_new_badge(message):
    user_states[message.chat.id]['name'] = message.text
    msg = bot.send_message(message.chat.id, "Enter new badge number:")
    bot.register_next_step_handler(msg, perform_update)

def perform_update(message):
    data = user_states.get(message.chat.id, {})
    officer_id = data.get('id')
    name = data.get('name')
    badge = message.text
    logic_layer.update_officer_logic(officer_id, name, badge)
    bot.send_message(message.chat.id, "✅ Officer updated successfully.")

@bot.message_handler(commands=['delete'])
def delete_handler(message):
    msg = bot.send_message(message.chat.id, "Enter officer ID to delete:")
    bot.register_next_step_handler(msg, perform_delete)

def perform_delete(message):
    officer_id = message.text
    logic_layer.delete_officer_logic(officer_id)
    bot.send_message(message.chat.id, "✅ Officer deleted successfully.")

if __name__ == "__main__":
    bot.polling()
