import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/validator.dart';
import '../../home/controller.dart';
import '../enum/enum.dart';
import 'controller.dart';


class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTaskController());

    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text("إضافة مهمة جديدة"), centerTitle: true),

      body: Form(
  key: controller.formKey,
  child: SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
         Text("عنوان المهمة"),
         SizedBox(height: 6),
        TextFormField(
          onChanged: (value) => controller.title.value = value,
          validator: (value) => Validator.requiredField(value, message: "عنوان المهمة مطلوب"),
          decoration: InputDecoration(
            hintText: "اكتب عنوان المهمة",
            border: OutlineInputBorder(),
          ),
        ),

         SizedBox(height: 20),

         Text("وصف المهمة"),
         SizedBox(height: 6),
        TextFormField(
          maxLines: 3,
          onChanged: (value) => controller.description.value = value,
          validator: (value) => Validator.requiredField(value, message: "وصف المهمة مطلوب"),
          decoration: InputDecoration(
            hintText: "اكتب وصف المهمة",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

         Text("المدة المتوقعة (بالدقائق)"),
         SizedBox(height: 6),
       TextFormField(
  keyboardType: TextInputType.number,
  onChanged: (value) {
    controller.duration.value = int.tryParse(value) ?? 0;
  },
  validator: (value) => Validator.numbersOnly(
    value,
    message: "المدة يجب أن تكون أرقام فقط",
  ),
  decoration: const InputDecoration(
    hintText: "مثال: 60",
    border: OutlineInputBorder(),
    
  ),
),


         SizedBox(height: 20),

         Text("التاريخ المتوقع"),
         SizedBox(height: 6),

        TextFormField(
          readOnly: true,
          controller: TextEditingController(
            text: controller.date.value.toString().split(" ")[0],
          ),
          validator: (value) => Validator.requiredField(value, message: "التاريخ مطلوب"),
          decoration: InputDecoration(
            hintText: "اختر التاريخ",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_month),
          ),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: controller.date.value,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) controller.date.value = picked;
          },
        ),

        const SizedBox(height: 20),

        const Text("الحالة"),
        const SizedBox(height: 6),
        DropdownButtonFormField<TaskStatus>(
          value: controller.status.value,
          items: const [
            DropdownMenuItem(value: TaskStatus.pending, child: Text("Pending")),
            DropdownMenuItem(value: TaskStatus.inProgress, child: Text("In Progress")),
            DropdownMenuItem(value: TaskStatus.done, child: Text("Done")),
          ],
          onChanged: (value) {
            if (value != null) controller.status.value = value;
          },
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom( backgroundColor: const Color.fromARGB(255, 142, 56, 196),  foregroundColor: Colors.white, ),
            onPressed: () {
              if (!controller.validate()) return;

              final task = controller.createTask();
              final home = Get.find<HomeController>();
              home.addTask(task);
              Get.back();
            },
            child: Text("حفظ المهمة"),
          ),
        ),
      ],
    ),
  ),
),

    );


  }
}
