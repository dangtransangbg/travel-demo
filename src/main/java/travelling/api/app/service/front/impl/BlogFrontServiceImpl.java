package travelling.api.app.service.front.impl;

import lombok.Data;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import travelling.api.app.entity.Blog;
import travelling.api.app.mapper.BlogMapper;
import travelling.api.app.model.request.BaseFilterRequest;
import travelling.api.app.model.response.ListResponse;
import travelling.api.app.model.response.blog.BlogResponse;
import travelling.api.app.repository.BlogRepository;
import travelling.api.app.service.front.BlogFrontService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Data
public class BlogFrontServiceImpl implements BlogFrontService {

    private final BlogRepository blogRepository;
    private final BlogMapper blogMapper;

    @Override
    public BlogResponse findById(long id) {
        return blogMapper.convertResponse(blogRepository.getOne(id));
    }

    @Override
    public ListResponse<BlogResponse> findAll(BaseFilterRequest filterRequest) {
        PageRequest pageRequest = PageRequest.of(filterRequest.getPageIndex(), filterRequest.getPageSize(), Sort.by("createdDate").descending());
        Page<Blog> blogs = blogRepository.findAll(pageRequest);
        List<BlogResponse> blogResponses = blogs.get().map(blogMapper::convertResponse).collect(Collectors.toList());
        return ListResponse.of(blogs.getTotalElements(), blogResponses);
    }
}
