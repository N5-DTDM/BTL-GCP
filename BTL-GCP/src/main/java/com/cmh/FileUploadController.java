package com.cmh;

import org.hibernate.Session;
import org.hibernate.Transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cmh.dao.DocumentDao;
import com.cmh.entity.Document;
import com.cmh.service.StorageFileNotFoundException;
import com.cmh.service.StorageService;
import com.cmh.service.UploadService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.stream.Collectors;

import javax.websocket.server.PathParam;

@Controller
public class FileUploadController {

	@Autowired
	private DocumentDao documentDao;

	private final StorageService storageService;

	@Autowired
	public FileUploadController(StorageService storageService) {
		this.storageService = storageService;
	}
	@GetMapping("/")
	public String welcome(Model model) throws IOException {
		return "welcome";
	}
	@GetMapping("web")
	public String web(Model model) throws IOException {
		return "webmau";
	}
	@GetMapping("/upload")
	public String uploadedFiles(Model model) throws IOException {

		model.addAttribute("files",
				storageService.loadAll()
						.map(path -> MvcUriComponentsBuilder
								.fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
								.build().toString())
						.collect(Collectors.toList()));
		Document document = new Document();
		model.addAttribute("document", document);
		return "Upload";
	}
	@GetMapping("listupload")
	public String listUploadedFiles(Model model) throws IOException {

		model.addAttribute("files",
				storageService.loadAll()
						.map(path -> MvcUriComponentsBuilder
								.fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
								.build().toString())
						.collect(Collectors.toList()));
		Document document = new Document();
		model.addAttribute("document", document);
		return "ListUpload";
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	@PostMapping("/upload")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException {

		File convFile = storageService.store(file);

		UploadService service = new UploadService();
		String url = service.Upload(convFile);

		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file.getOriginalFilename() + "! And Uploaded to Drive View: " + url);
		return "redirect:/upload";
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") Integer id, Model model) {
		Document document = documentDao.findOne(id);
		model.addAttribute("document", document);
		return "Upload";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, @ModelAttribute("document") Document document,
			@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
		System.out.println(document.getTitle());

		File convFile = storageService.store(file);

		UploadService service = new UploadService();
		String url = service.Upload(convFile);

		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file.getOriginalFilename() + "! And Uploaded to Drive View: " + url);
		document.setUrl(url);
		documentDao.save(document);
		System.out.println(document.getId());
		return "Upload";
	}

	@ModelAttribute("documents")
	public List<Document> getDocuments() {
		return (List<Document>) documentDao.findAll();
	}
}
