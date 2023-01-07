from faker import Faker

RESTAURANT_COUNT = 10
DELIVERY_COUNT = 120_000
CLIENT_COUNT = 120_000
BONUS_COUNT = 5
CHEF_COUNT = 100
INVOICE_COUNT = 300_000
MENU_COUNT = 4
WORKER_COUNT = 1000
PRODUCT_COUNT = 22
PAYMENT_COUNT = 100_000
PLACE_COUNT = 100_000


class Restaurant:
    restaurant_names = ['Naleśniczek', 'Bistro Masełko', 'Burger & Co', 'Krówka', 'Smaczne Bistro', 'Tanio i smacznie',
                        'Bistro Bułeczka', 'Jabłko', 'Gruszka', 'Melon i Spółka']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = self.restaurant_names[self.ID - 1]
        self.CITY = fake.city()
        self.ADM_UNIT = fake.administrative_unit()


class Bonus:
    bonus_names = ['Brak', 'Dla studentów', 'Dla emerytów', 'Dla pracowników', 'Duża rodzina']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = self.bonus_names[self.ID - 1]
        self.DISCOUNT = fake.pyint(min_value=0, max_value=20, step=5)


class Chef:
    exp_choices = [1, 2, 3, 4]

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = fake.first_name()
        self.SURNAME = fake.last_name()
        self.SENIORITY = fake.random_choices(elements=self.exp_choices, length=1)[0]


class Client:
    gender_choices = ['M', 'K']
    type_choices = ['Pracownik', 'Stały klient', 'Zwykły']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.GENDER = fake.random_choices(elements=self.gender_choices, length=1)[0]
        self.AGE = fake.random_int(max=80)
        self.TYPE = fake.random_choices(elements=self.type_choices, length=1)[0]


class Delivery:
    exp_choices = [1, 2, 3, 4]
    transport_choices = ['Samochód', 'Skuter', 'Pieszo', 'Rower', 'Hulajnoga']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = fake.first_name()
        self.SURNAME = fake.last_name()
        self.SENIORITY = fake.random_choices(elements=self.exp_choices, length=1)[0]
        self.TRANSPORT = fake.random_choices(elements=self.transport_choices, length=1)[0]
        self.TIME_MINUTES = fake.random_int(max=90)


class Invoice:
    exp_choices = [1, 2, 3, 4]
    transport_choices = ['Samochód', 'Skuter', 'Pieszo', 'Rower', 'Hulajnoga']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.RESTAURANT_ID = fake.random_int(min=1, max=RESTAURANT_COUNT)
        self.PLACE_ID = fake.random_int(min=1, max=PLACE_COUNT)
        self.PRODUCT_ID = fake.random_int(min=1, max=PRODUCT_COUNT)
        self.MENU_ID = fake.random_int(min=1, max=MENU_COUNT)
        self.CHEF_ID = fake.random_int(min=1, max=CHEF_COUNT)
        self.PAYMENT_ID = fake.random_int(min=1, max=PAYMENT_COUNT)
        self.WORKER_ID = fake.random_int(min=1, max=WORKER_COUNT)
        self.DELIVERY_ID = fake.random_int(min=1, max=DELIVERY_COUNT)
        self.BONUS_ID = fake.random_int(min=1, max=BONUS_COUNT)
        self.CLIENT_ID = fake.random_int(min=1, max=CLIENT_COUNT)
        self.QUANTITY = fake.random_int(min=1, max=5)
        self.PRICE = fake.random_int(min=1, max=1000)
        self.CLIENT_RATING = fake.random_int(min=1, max=10)
        self.HOUR = fake.random_int(min=0, max=23)
        self.DAY = fake.random_int(min=1, max=30)
        self.WEEKDAY = fake.random_int(min=1, max=7)
        self.MONTH = fake.random_int(min=1, max=12)
        self.YEAR = fake.random_int(min=1997, max=2023)


class Menu:
    name_choices = ['Dla dzieci', 'Zwyczajne', 'Premium', 'Wegańskie']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = self.name_choices[self.ID - 1]


class Payment:
    method_choices = ['Karta', 'Gotówka', 'Czek', 'Bon']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.BILL_NUMBER = fake.random_int(max=INVOICE_COUNT)
        self.METHOD = fake.random_choices(elements=self.method_choices, length=1)[0]
        self.TIP = fake.random_int(max=150)


class Place:
    type_choices = ['Dostawa', 'Na miejscu', 'Na wynos']

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.TYPE = fake.random_choices(elements=self.type_choices, length=1)[0]
        self.CITY = fake.city()
        self.ADM_UNIT = fake.administrative_unit()
        self.STREET = fake.street_name()


class Worker:
    exp_choices = [1, 2, 3, 4]

    def __init__(self, id: int, fake: Faker):
        self.ID = id
        self.NAME = fake.first_name()
        self.SURNAME = fake.last_name()
        self.SENIORITY = fake.random_choices(elements=self.exp_choices, length=1)[0]


def generate(generate_class, count, fake):
    for i in range(count):
        yield generate_class(i + 1, fake)


def main():
    import pandas as pd
    fake = Faker(['pl-PL'])

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Restaurant, RESTAURANT_COUNT, fake))]).to_csv(
        'Restaurant.csv', index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Bonus, BONUS_COUNT, fake))]).to_csv('Bonus.csv',
                                                                                                     index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Chef, CHEF_COUNT, fake))]).to_csv('Chef.csv',
                                                                                                   index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Client, CLIENT_COUNT, fake))]).to_csv('Client.csv',
                                                                                                       index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Delivery, DELIVERY_COUNT, fake))]).to_csv(
        'Delivery.csv', index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Invoice, INVOICE_COUNT, fake))]).to_csv('Invoice.csv',
                                                                                                         index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Menu, MENU_COUNT, fake))]).to_csv('Menu.csv',
                                                                                                   index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Payment, PAYMENT_COUNT, fake))]).to_csv('Payment.csv',
                                                                                                         index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Place, PLACE_COUNT, fake))]).to_csv('Place.csv',
                                                                                                     index=False)

    pd.DataFrame.from_records([e.__dict__ for e in list(generate(Worker, WORKER_COUNT, fake))]).to_csv('Worker.csv',
                                                                                                       index=False)


if __name__ == "__main__":
    main()
