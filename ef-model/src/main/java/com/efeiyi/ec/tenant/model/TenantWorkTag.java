package com.efeiyi.ec.tenant.model;

import com.efeiyi.ec.product.model.ProductDescription;
import com.efeiyi.ec.product.model.ProductPicture;
import com.efeiyi.ec.project.model.Category;
import com.efeiyi.ec.project.model.Project;
import com.efeiyi.ec.project.model.ProjectTag;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/26.
 */
@Entity
@Table(name = "product")
public class TenantWorkTag {
    private String id;
    private TenantWork tenantWork;
    private ProjectTag projectTag;
    private String status;

    @Id
    @GenericGenerator(name = "id", strategy = "com.ming800.core.p.model.M8idGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    public TenantWork getTenantWork() {
        return tenantWork;
    }

    public void setTenantWork(TenantWork tenantWork) {
        this.tenantWork = tenantWork;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    public ProjectTag getProjectTag() {
        return projectTag;
    }

    public void setProjectTag(ProjectTag projectTag) {
        this.projectTag = projectTag;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
