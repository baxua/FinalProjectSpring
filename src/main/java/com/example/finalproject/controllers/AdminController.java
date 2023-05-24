package com.example.finalproject.controllers;

import com.example.finalproject.enumm.Status;
import com.example.finalproject.models.*;
import com.example.finalproject.repositories.CategoryRepository;
import com.example.finalproject.repositories.OrderRepository;
import com.example.finalproject.repositories.PersonRepository;
import com.example.finalproject.services.OrderService;
import com.example.finalproject.services.PersonService;
import com.example.finalproject.services.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {

    private final ProductService productService;

    private final PersonService personService;
    private final OrderService orderService;

    private final OrderRepository orderRepository;
    private final PersonRepository personRepository;

    @Value("${upload.path}")
    private String uploadPath;

    private final CategoryRepository categoryRepository;


    public AdminController(ProductService productService, PersonService personService, OrderService orderService, OrderRepository orderRepository, PersonRepository personRepository, CategoryRepository categoryRepository) {

        this.productService = productService;
        this.personService = personService;
        this.orderService = orderService;
        this.orderRepository = orderRepository;
        this.personRepository = personRepository;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("admin/product/add")
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryRepository.findAll());
        return "product/addProduct";
    }

    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("file_one") MultipartFile file_one, @RequestParam("file_two") MultipartFile file_two, @RequestParam("file_three") MultipartFile file_three, @RequestParam("file_four") MultipartFile file_four, @RequestParam("file_five") MultipartFile file_five, @RequestParam("category") int category, Model model) throws IOException {
        Category category_db = (Category) categoryRepository.findById(category).orElseThrow();
        System.out.println(category_db.getName());
        if (bindingResult.hasErrors()) {
            model.addAttribute("category", categoryRepository.findAll());
            return "product/addProduct";
        }

        if (file_one != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_one.getOriginalFilename();
            file_one.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);

        }

        if (file_two != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_two.getOriginalFilename();
            file_two.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if (file_three != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_three.getOriginalFilename();
            file_three.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if (file_four != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_four.getOriginalFilename();
            file_four.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if (file_five != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_five.getOriginalFilename();
            file_five.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        productService.saveProduct(product, category_db);
        return "redirect:/admin";
    }


    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("products", productService.getAllProduct());
        return "admin";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productService.deleteProduct(id);
        return "redirect:/admin";
    }

    @GetMapping("admin/product/edit/{id}")
    public String editProduct(Model model, @PathVariable("id") int id) {
        model.addAttribute("product", productService.getProductId(id));
        model.addAttribute("category", categoryRepository.findAll());
        return "product/editProduct";
    }

    @PostMapping("admin/product/edit/{id}")
    public String editProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @PathVariable("id") int id, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("category", categoryRepository.findAll());
            return "product/editProduct";
        }
        productService.updateProduct(id, product);
        return "redirect:/admin";
    }

    @GetMapping("admin/order_info")
    public String ordersInfo(Model model) {

        List<Order> orderList = orderRepository.findAll();
        model.addAttribute("orders", orderList);

        return "orderInfo";
    }

    @GetMapping("admin/order_info/{id}")
    public String editStatus(Model model, @PathVariable("id") int id) {
        model.addAttribute("order", orderService.getOrdertId(id));
        model.addAttribute("status", Status.values());
        return "order_edit";
    }

    @PostMapping("admin/order_info/{id}")
    public String editStatus(@ModelAttribute("order") Order order, BindingResult bindingResult, @PathVariable("id") int id, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("status", Status.values());
            return "redirect:/admin";
        }
        orderService.updateOrder(id, order);
        System.out.println(Status.values());
        return "redirect:/admin";
    }

    @PostMapping("/orderInfo/search")
    public String orderSearch(@RequestParam("search") String search, Model model) {
        List<Order> orderList = orderRepository.findAll();
        model.addAttribute("orders", orderList);
        model.addAttribute("search_order", orderRepository.findByLastFourChars(search));

        model.addAttribute("value_search", search);
        return "orderInfo";
    }

    @GetMapping("admin/person_info")
    public String personInfo(Model model) {

        List<Person> personList = personRepository.findAll();
        model.addAttribute("person", personList);

        return "personInfo";
    }

    @GetMapping("admin/person_info/{id}")
    public String editPersonRole(Model model, @PathVariable("id") int id) {
        model.addAttribute("person", personService.getPersonId(id));
        return "person_edit";
    }
    @PostMapping("admin/person_info/{id}")
    public String editPersonRole(@ModelAttribute("person") Person person, BindingResult bindingResult, @PathVariable("id") int id, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("role", personRepository.findAllRoles());
            return "personInfo";
        }
        personService.updatePerson(id, person);
        return "redirect:/admin";
    }
}
