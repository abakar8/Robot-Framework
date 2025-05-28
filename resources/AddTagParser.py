from robot.api import TestSuiteBuilder
import os

class AddTagParser:
    EXTENSION = "robot"  # Corrigé : guillemets droits

    def __init__(self):
        pass

    def parse(self, source):
        file_name = os.path.basename(source)
        # Charger la suite de tests
        suite = TestSuiteBuilder().build(source)

        # Ajouter un tag personnalisé à chaque test
        for test in suite.tests:
            test.tags.add("custom_tag")
            print(f"Added tag 'custom_tag' to test: {test.name}")

        # Nom du fichier de sortie
        output = file_name.replace(".robot", "_modified.robot")

        # Sauvegarder la suite modifiée
        with open(output, "w", encoding="utf-8") as file:
            file.write(self._generate_robot_content(suite))

        print(f"Modified test suite saved to: {output}")
        return suite

    def _generate_robot_content(self, suite):
        # Générer le contenu Robot Framework
        content = "*** Settings ***\n"
        for setting in suite.resource.imports:
            content += f"{setting.type}    {setting.name}\n"

        content += "\n*** Test Cases ***\n"
        for test in suite.tests:
            content += f"{test.name}\n"
            if test.tags:
                content += f"    [Tags]    {'    '.join(test.tags)}\n"
            for item in test.body:
                if item.type == "KEYWORD":
                    args = "    ".join(item.args)
                    content += f"    {item.name}    {args}\n"
            content += "\n"

        return content
