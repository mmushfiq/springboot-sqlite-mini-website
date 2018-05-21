package az.mm.developerjobs.repository;

import az.mm.developerjobs.entity.JobInfo;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author MM <mushfiqazeri@gmail.com>
 */
public interface JobRepository extends JpaRepository<JobInfo, Integer> {
    
    JobInfo findById(int id);
    
    JobInfo findByIdAndUrlSuffix(int id, String urlSuffix);
    
    List<JobInfo> findAllByCountryCode(String countryCode);
    
    Page<JobInfo> findAllByCountryCode(String countryCode, Pageable page);

    int countByCountryCode(String countryCode);
    
    @Query(value = "select * from all_vacancies where country_code = :countryCode order by id desc limit :start, :limit", nativeQuery = true)
    List<JobInfo> getJobsWithLimit(@Param("countryCode") String countryCode, @Param("start") int start, @Param("limit") int limit);
    
    @Query(value = "select * from all_vacancies where job_title like %?1% or company like %?1% or content like %?1% order by id desc", nativeQuery = true)
    List<JobInfo> searchResult(String searchText);
    
}
