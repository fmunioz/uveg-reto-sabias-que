#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.85 blue:0.6 alpha:1.0]; // light orange

    self.selectedCategory = @"Motociclismo";
    self.currentIndex = 0;
    self.facts = @{
        @"Motociclismo": @[
            @"La primera motocicleta fue creada en 1885 por Gottlieb Daimler y Wilhelm Maybach, y se llamaba Daimler Reitwagen",
            @"La moto más rápida del mundo es la Dodge Tomahawk, que alcanza más de 560 km/h (aunque no es legal en carreteras públicas).",
            @"Montar en moto mejora el equilibrio, la concentración y reduce el estrés, según estudios psicológicos."
        ],
        @"Senderismo": @[
            @"El sendero más largo del mundo es el Sendero de los Apalaches (EE. UU.), con 3,500 km de extensión.",
            @"Caminar en pendientes quema hasta 500 calorías por hora, fortaleciendo piernas y corazón.",
            @"En alta montaña, la temperatura puede bajar 1°C cada 150 metros de ascenso, por lo que hay que ir preparado."
        ],
        @"Casa y jardin": @[
            @"La Sansevieria o lengua de suegra elimina toxinas del aire y sobrevive con poca luz.",
            @"Regar las plantas al amanecer o atardecer reduce la evaporación y ahorra hasta 30% de agua.",
            @"El vinagre blanco diluido en agua es un herbicida ecológico para eliminar malas hierbas sin químicos."
        ]
    };

    CGFloat width = self.view.frame.size.width;

    self.motoButton = [self createCategoryButtonWithTitle:@"Motociclismo" x:20];
    self.hikingButton = [self createCategoryButtonWithTitle:@"Senderismo" x:(width / 2 - 50)];
    self.homeButton = [self createCategoryButtonWithTitle:@"Casa y jardin" x:(width - 120)];

    self.factLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, width - 40, 100)];
    self.factLabel.textAlignment = NSTextAlignmentCenter;
    self.factLabel.font = [UIFont boldSystemFontOfSize:20];
    self.factLabel.textColor = [UIColor blackColor];
    self.factLabel.numberOfLines = 0;
    self.factLabel.text = self.facts[self.selectedCategory][self.currentIndex];
    [self.view addSubview:self.factLabel];

    self.nextFactButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.nextFactButton.frame = CGRectMake(width/2 - 100, 320, 200, 50);
    [self.nextFactButton setTitle:@"Mostrar dato curioso" forState:UIControlStateNormal];
    self.nextFactButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.nextFactButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextFactButton.backgroundColor = [UIColor orangeColor];
    self.nextFactButton.layer.cornerRadius = 10;
    [self.nextFactButton addTarget:self action:@selector(showNextFact) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextFactButton];
}

- (UIButton *)createCategoryButtonWithTitle:(NSString *)title x:(CGFloat)x {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(x, 100, 100, 40);
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [title isEqualToString:self.selectedCategory] ? [UIColor redColor] : [UIColor orangeColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [button addTarget:self action:@selector(selectCategory:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (void)selectCategory:(UIButton *)sender {
    self.selectedCategory = sender.titleLabel.text;
    self.currentIndex = 0;
    self.factLabel.text = self.facts[self.selectedCategory][self.currentIndex];
    [self updateButtonColors];
}

- (void)updateButtonColors {
    NSArray *buttons = @[self.motoButton, self.hikingButton, self.homeButton];
    for (UIButton *btn in buttons) {
        btn.backgroundColor = [btn.titleLabel.text isEqualToString:self.selectedCategory] ? [UIColor redColor] : [UIColor orangeColor];
    }
}

- (void)showNextFact {
    NSArray *categoryFacts = self.facts[self.selectedCategory];
    self.currentIndex = (self.currentIndex + 1) % categoryFacts.count;
    self.factLabel.text = categoryFacts[self.currentIndex];
}

@end